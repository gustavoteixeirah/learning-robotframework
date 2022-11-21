def factory_404_partner():
    partner = {
        "name": "Frangão",
        "email": "contact@frangao.com",
        "whatsapp": "55999696521",
        "business": "Restaurante",
    }
    return partner


def factory_disable_partner():
    partner = {
        "name": "Natura",
        "email": "contact@natura.com",
        "whatsapp": "55999696222",
        "business": "Supermercado",
    }
    return partner


def factory_remove_partner():
    partner = {
        "name": "Copos da Raposa",
        "email": "contact@copos.com",
        "whatsapp": "55999166522",
        "business": "Conveniência",
    }
    return partner


def factory_enable_partner():
    partner = {
        "name": "Nay Esmaltaria",
        "email": "contact@esmaltaria.com",
        "whatsapp": "55999696522",
        "business": "Conveniência",
    }
    return partner


def factory_new_partner():
    partner = {
        "name": "Kode GT",
        "email": "contact@gustavoteixeira.dev",
        "whatsapp": "55999696541",
        "business": "Restaurante",
    }
    return partner


def factory_dup_name():
    partner = {
        "name": "Adega do João",
        "email": "contact@joao.adega",
        "whatsapp": "55999998877",
        "business": "Conveniência",
    }
    return partner


def factory_partner_list():

    p_list = [
        {"name": "Adega do João", "email": "contact@joao.adega", "whatsapp": "55999998877", "business": "Conveniência"},
        {
            "name": "Mercearia da Mary Jane",
            "email": "contact@mary.com",
            "whatsapp": "55999991177",
            "business": "Restaurante",
        },
        {
            "name": "Mercadinho São Francisco",
            "email": "contact@francisco.com",
            "whatsapp": "11999993317",
            "business": "Supermercado",
        },
    ]

    return p_list
