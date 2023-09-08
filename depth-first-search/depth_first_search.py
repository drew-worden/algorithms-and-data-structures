# Implementation of the Depth First Search Algorithm in Python
# by Drew Worden

graph = {
    "A": ["B", "G"],
    "B": ["C", "D", "E"],
    "C": [],
    "D": [],
    "E": ["F"],
    "F": [],
    "G": ["H"],
    "H": ["I"],
    "I": [],
}


def depth_first_search(graph, node):
    visited = []
    stack = []

    visited.append(node)
    stack.append(node)

    while stack:
        s = stack.pop()
        print(s, end=" ")

        for n in reversed(graph[s]):
            if n not in visited:
                visited.append(n)
                stack.append(n)


def main():
    depth_first_search(graph, "A")


main()
