.neuron/dist: $(shell find . -name "*.md")
	neuron rib -o .neuron/dist

deploy: .neuron/dist
	rsync --delete-excluded .neuron/dist/* nusakan-58:neuron-site/
