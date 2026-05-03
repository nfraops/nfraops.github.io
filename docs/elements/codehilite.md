# Code Highlighting

This site uses PyMdown extensions for syntax highlighting.

## Usage

Code blocks are automatically highlighted based on the language specified in the fence.

## Example

```python
def hello_world():
    print("Hello, World!")
```

```bash
echo "Hello from the shell"
```

## Supported Languages

- Python
- Bash
- YAML
- JavaScript
- JSON
- And many more...

## Configuration

Syntax highlighting is configured through:
- `pymdownx.highlight` extension
- Pygments for syntax highlighting
- Material theme for styling
