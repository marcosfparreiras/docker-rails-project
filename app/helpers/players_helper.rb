module PlayersHelper
  def player_main_attributes(player)
    {
      'Nome' => player.name,
      'Data de Nascimento' => player.print_birthday,
      'Idade' => player.age,
      'Celular' => player.print_phones,
      'Nome do Resp.' => player.responsible_name,
      'Celular do Resp.' => player.print_responsible_phones,
      'Email do Resp.' => player.responsible_email,
      'Situação Pagamento (AE)' => player.platform_payment_mode,
      'Situação Pagamento (AF)' => player.advisory_payment_mode
    }
  end

  def player_main_attributes_headers
    [
      'Nome', 'Data de Nascimento', 'Idade', 'Celular', 'Nome do Resp.',
      'Celular do Resp.', 'Email do Resp.', 'Situação Pagamento (AE)',
      'Situação Pagamento (AF)'
    ]
  end

  def link_activate_deactive(player)
    if player.active?
      link_to 'Deactivate', deactivate_player_path(player),
        method: :put,
        remote: true,
        id: "deactivate_player_#{player.id}",
        class: 'btn btn-danger btn-sm',
        data: {
          confirm: "Are you sure you want to deactivate #{player.name}?"
        }
    else
      link_to 'Activate', activate_player_path(player),
        method: :put,
        remote: true,
        id: "activate_player_#{player.id}",
        class: 'btn btn-success btn-sm',
        data: {
          confirm: "Are you sure you want to activate #{player.name}?"
        }
    end
  end
end
