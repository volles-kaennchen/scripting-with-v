new:
ifeq ($(OS),Windows_NT)
	chcp 1252
endif
	vagrant up
	vagrant reload

fresh: clean
	vagrant up
	vagrant reload

clean:
	vagrant destroy -f
ifeq ($(OS),Windows_NT)
	powershell "Remove-Item -Recurse .\.vagrant"
else
	rm -rf .vagrant
endif
