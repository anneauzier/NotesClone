//
//  ViewCodeProtocol.swift
//  notes-clone
//
//  Created by Anne Auzier on 19/06/24.
//

import Foundation

// MARK: Estou criando esse protocolo pois quero que qualquer View que eu vá usar, siga um padrão de estrutura de criação de componentes.

protocol ViewCodeProtocol {
    func addSubviews()
    func setupConstraints()
    func setupAdditionalConfiguration()
}

extension ViewCodeProtocol {
    func setupAdditionalConfiguration() {}

    func setup() {
        addSubviews()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}


