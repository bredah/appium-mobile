module TrianguloScreen
  ## Screen
  @screen = {:by => :xpath, :value => '//*[@name="Triângulo"]'}
  ## Field's
  @field_lado_a = {:by => :name, :value => 'LADO_A'}
  @field_lado_b = {:by => :name, :value => 'LADO_B'}
  @field_lado_c = {:by => :name, :value => 'LADO_C'}
  ## Button's
  @button_valiar = {:by => :name, :value => 'VALIDAR'}
  @button_limpar = {:by => :name, :value => 'LIMPAR'}
  ## Label's

  ## Text's
  @text_mensagem = {:by => :name, :value => 'MENSAGEM_VALIDACAO'}

  ## Method's

  def self.screen
    Driver.displayed(@screen)
  end

  def self.preencher_lado(lado, valor)
    case lado.to_s.downcase
      when 'a'
        Driver.send_keys(@field_lado_a, valor)
      when 'b'
        Driver.send_keys(@field_lado_b, valor)
      when 'c'
        Driver.send_keys(@field_lado_c, valor)
      else
    end
  end

  def self.validar
    Driver.touch(@button_valiar)
    Driver.get_text(@text_mensagem)
  end

  def self.limpar
    Driver.touch(@button_limpar)
  end
end
