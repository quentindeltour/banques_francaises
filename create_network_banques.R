# Libraries
library(igraph)
library(networkD3)
library(openxlsx)
library(d3r)

# read nodes and edges
data_nodes <- read.xlsx("./data/nodes_banques.xlsx")
data_edges <- read.xlsx("./data/edges_banques.xlsx", sheet = 2)

#Make network using NetworkD3
network_banques <- forceNetwork(Links = data_edges,
                  Nodes = data_nodes, 
                  Source = "Source",
                  Target = "Target",
                  Value = "Value",
                  NodeID = "Banque",
                  Nodesize = "Clients",
                  Group = "Type",
                  #height="700px",
                  #width="700px",
                  colourScale = JS("d3.scaleOrdinal(d3.schemeCategory10);"),
                  radiusCalculation = JS(" Math.sqrt(d.nodesize)+2"),
                  linkDistance = 100,          # distance between node. Increase this value to have more space between nodes
                  charge = -200,                # numeric value indicating either the strength of the node repulsion (negative value) or attraction (positive value)
                   fontSize = 14,               # size of the node names
                   fontFamily = "serif",       # font og node names
                   linkColour = "#666",        # colour of edges, MUST be a common colour for the whole graph
                   opacity = 0.9,              # opacity of nodes. 0=transparent. 1=no transparency
                   zoom = T,                    # Can you zoom on the figure?
                  legend = T,
                  arrows = T,                    # Can you zoom on the figure?
                  opacityNoHover=0.6
                  )

network_banques

# Save network to html
saveNetwork(network_banques, "./output/network_banques.html", selfcontained = TRUE)
