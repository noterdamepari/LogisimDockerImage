include config.mk

# colors variables
GREEN  := \033[1;32m
RED    := \033[1;31m
YELLOW := \033[1;33m
CYAN   := \033[1;36m
BLUE   := \033[4;34m
RESET  := \033[0m

build-container: 
	@printf "$(CYAN)📦 Building Logisim Docker image...$(RESET)\n"
	@docker build -t logisim-docker .
	@printf "$(GREEN)✅ Build finished!$(RESET)\n"

up-logisim:
	@docker run -d --rm \
	--name Logisim \
	-v $(LOGISIM_VOLUME):/workspace \
	-p $(LOGISIM_PORT):5800 \
	-p $(LOGISIM_VNC_PORT):5900 \
	-p $(DEBUG_PORT):7001 \
	-e "DISPLAY_WIDTH=$(DISPLAY_WIDTH)" \
	-e "DISPLAY_HEIGHT=$(DISPLAY_HEIGHT)" \
	logisim-docker
	@printf "\n $(GREEN)✔ Logisim is running!$(RESET)\n"
	@printf " 🖥  URL: $(CYAN)http://127.0.0.1:$(LOGISIM_PORT)$(RESET)\n"
	@printf " 💡 Hint: Use $(YELLOW)[Opt/Alt + Left Click]$(RESET) to interact\n\n"

down-logisim: 
	@docker stop Logisim > /dev/null 2>&1 && \
	printf "$(RED)🛑 Logisim has been stopped$(RESET)\n" 

status-logisim:
	@STATE=$$(docker inspect --format='{{.State.Status}}' Logisim 2>/dev/null); \
	if [ "$$STATE" = "running" ]; then \
		printf " $(GREEN)●$(RESET) Logisim is $(GREEN)running$(RESET)\n"; \
		printf "    ID:   $$(docker ps -aqf "name=Logisim")\n"; \
		printf "    Port: $(LOGISIM_PORT) (Web) / $(LOGISIM_VNC_PORT) (VNC)\n"; \
		printf "    URL:  $(CYAN)http://127.0.0.1:$(LOGISIM_PORT)$(RESET)\n"; \
	else \
		printf " $(RED)○$(RESET) Logisim is $(RED)not running$(RESET)\n"; \
	fi
