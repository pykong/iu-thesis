"""
Export the contents of a files in a dir to markdown code blocks.
This can be used for example as a helper for written assignments when the
contents need to be included as a text export.

A tree of the directory is also prepended.

Files and dirs can also be ignore via gitignore style patterns provided in
a patterns.list file. (Note that pattern might not affect the tree creation.)

"""
import re
import sys
from pathlib import Path
from subprocess import check_output
from typing import Final

from pathspec import PathSpec

PATTERNS_FILE: Final[str] = "code/utils/patterns.list"  # TODO: Do not hardcode
with open(PATTERNS_FILE, "r") as fh:
    SPEC: Final[PathSpec] = PathSpec.from_lines("gitwildmatch", fh)


def make_markdown_block(lst_id: str, caption: str, ext: str, body: str) -> str:
    """Creates a markdown code block.

    Args:
        lst_id (str): Listing id.
        caption (str): Caption.
        ext (str): File extension
        body (str): Body of the block.

    Returns:
        str: The create code block.
    """
    block_info = []
    if lst_id:
        block_info.append("#lst:" + lst_id)
    if caption:
        block_info.append(f'caption="{caption}"')
    if ext:
        block_info.append(ext)

    if block_info:
        block_info = "{" + " ".join(block_info) + "}"

    return f"```{block_info}\n{body}\n```"


def make_code_import(name: Path) -> str:
    """Create code block to be used with pandoc-include.

    Args:
        name (Path): The path of the file to be imported.

    Returns:
        str: The created code block.
    """
    clean_name = re.sub("[^a-zA-Z0-9_]", "_", str(name))
    code_ref = f"!include ../{name}"
    return make_markdown_block(
        lst_id=clean_name, caption=name, ext=name.suffix, body=code_ref
    )


def make_filetree(p: Path) -> str:
    """Create a file tree in a markdown block.

    Args:
        p (Path): The directory to be mapped.

    Returns:
        str: The tree cased in a markdown block.
    """
    cmd = f"tree -n -I __pycache__ --sort=name --noreport --dirsfirst {p}"
    output = check_output(cmd, shell=True)
    output = output.decode()
    output = output.split("\n")[1:-1]  # eliminate 1st and last line
    output = "\n".join(output)
    return make_markdown_block(
        lst_id="code_dir_tree", caption="Code Dir Tree", ext=".txt", body=output
    )


def main(proj_dir: Path, output_file: Path) -> None:
    """The main method, binding together all subfunctions.

    Args:
        proj_dir (Path): The directory to be exported.
        output_file (Path): The export destination.

    Raises:
        Exception: Throws if proj_dir does not exist.
        Exception: Throws if proj_dir is not a directory.
        Exception: If file can not be read.
    """

    # some basic checks
    if not proj_dir.exists():
        raise Exception(f"{proj_dir} does not exist.")
    elif not proj_dir.is_dir():
        raise Exception(f"{proj_dir} is not a dir.")

    # get all files_ from dir
    files_ = [p for p in proj_dir.rglob("*") if p.is_file() and not SPEC.match_file(p)]
    files_ = sorted(files_)

    # creat code blocks from list of files_
    code_blocks = {}
    for p in files_:
        name = p.relative_to(proj_dir.parent)
        try:
            code_blocks[name] = make_code_import(name)
        except Exception:
            print(f"Can not read: {name}")

    # compile to single file
    tree = make_filetree(proj_dir)
    comp = "\n\n".join((tree, *code_blocks.values())) + "\n"
    output_file.write_text(comp)


if __name__ == "__main__":
    proj_dir = Path(sys.argv[1])
    output_file = Path(sys.argv[2] if len(sys.argv) > 2 else "listings.md")
    main(proj_dir, output_file)
