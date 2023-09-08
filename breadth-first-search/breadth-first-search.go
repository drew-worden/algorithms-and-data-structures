//Implementation of the Breadth First Search Algorithm in Go
//by Drew Worden

package main

import "fmt"

type Graph struct {
    nodes map[int][]int
}

func NewGraph() *Graph {
    return &Graph{
        nodes: make(map[int][]int),
    }
}

func (g *Graph) AddEdge(u, v int) {
    g.nodes[u] = append(g.nodes[u], v)
    g.nodes[v] = append(g.nodes[v], u)
}

func BFS(graph *Graph, start int) []int {
    visited := make(map[int]bool)
    queue := []int{start}
    result := []int{}

    for len(queue) > 0 {
        node := queue[0]
        queue = queue[1:]
        if !visited[node] {
            visited[node] = true
            result = append(result, node)
            neighbors := graph.nodes[node]
            for _, neighbor := range neighbors {
                if !visited[neighbor] {
                    queue = append(queue, neighbor)
                }
            }
        }
    }

    return result
}

func main() {
    graph := NewGraph()

    graph.AddEdge(0, 1)
    graph.AddEdge(0, 2)
    graph.AddEdge(1, 3)
    graph.AddEdge(1, 4)
    graph.AddEdge(2, 5)

    startNode := 0
    result := BFS(graph, startNode)
    fmt.Println(result)
}
