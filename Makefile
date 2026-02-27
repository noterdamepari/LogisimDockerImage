build-container: 
	@docker build -t logisim-docker .

logisim-up:
	@docker run -d --rm --name Logisim -p 5800:5800 -p 5900:5900 logisim-docker && echo http://127.0.0.1:5800

logisim-down: 
	@docker stop Logisim