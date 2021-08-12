class Ability
  include CanCan::Ability

  def initialize(usuario)
    send("#{usuario.rol.nombre}_permisos", usuario)
  end

  def administrador_permisos(usuario)
    can :manage, :all
  end
  
  def cliente_permisos(usuario)
    can :manage, :all
  end

  def visitante_permisos(usuario)
    can [:create], Usuario, :all
  end

  def lista_de_permisos
    rules.map do |rule|
      object = { acciones: rule.actions, sobre: rule.subjects.map{ |s| s.is_a?(Symbol) ? s : s.name } }
      object[:condiciones] = rule.conditions unless rule.conditions.blank?
      object[:inverted] = true unless rule.base_behavior
      object
    end
  end
end
