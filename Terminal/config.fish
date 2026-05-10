if status is-interactive
	starship init fish | source
	bass source ~/.bash_profile

	# Colores de sintaxis personalizados
	set -g fish_color_command 50fa7b    # Comandos válidos
	set -g fish_color_error ff5555      # Errores
	set -g fish_color_param 009DFF      # Parámetros
	set -g fish_color_quote f1fa8c      # Comillas
	set -g fish_color_option 009DFF     # Flags ( -la, -rf, --help)
	set -g fish_color_param FFAE00	    # Rutas
	
	# Commands to run in interactive sessions can go here
end

# Added by LM Studio CLI tool (lms)
set -gx PATH $PATH /home/mario/.lmstudio/bin

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
