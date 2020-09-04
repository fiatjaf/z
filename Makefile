.neuron/dist: $(shell find . -name "*.md")
	neuron rib -o .neuron/dist

deploy: .neuron/dist
	rsync .neuron/dist/* nusakan-58:neuron-site/
