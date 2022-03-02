.neuron/dist: $(shell find . -name "*.md")
	neuron rib -o .neuron/dist

deploy: .neuron/dist
	rsync --delete-excluded -r .neuron/dist/* turgot:fiatjaf.com/neuron-site/
