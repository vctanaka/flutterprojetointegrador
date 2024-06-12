# SKIN SAGA

# Projeto Flutter PWA para Tratamento de Pele

## Descrição do Projeto

Este projeto é uma aplicação web progressiva (PWA) desenvolvida em Flutter com o objetivo de fornecer uma plataforma para tratamento de pele. A aplicação permite que os usuários façam diagnósticos, recebam recomendações personalizadas e acompanhem seus tratamentos de pele. O backend da aplicação é construído com Laravel, que se comunica com um banco de dados PostgreSQL para armazenar e gerenciar os dados dos usuários e tratamentos.

## Funcionalidades

### Frontend (Flutter)
- **Interface de usuário responsiva**: Desenvolvida em Flutter, a interface é amigável e adaptável a diferentes dispositivos, incluindo desktops, tablets e smartphones.
- **Diagnóstico de pele**: Ferramenta que permite aos usuários preencher questionários e enviar fotos para receber um diagnóstico inicial.
- **Recomendações personalizadas**: Baseado no diagnóstico, os usuários recebem recomendações personalizadas de tratamentos e produtos.
- **Acompanhamento de progresso**: Os usuários podem registrar e acompanhar o progresso do seu tratamento de pele ao longo do tempo.
- **Notificações push**: Notificações para lembrar os usuários de suas atividades e tratamentos.

### Backend (Laravel) - https://github.com/vctanaka/appProjetoIntegrador
- **Autenticação e autorização**: Gerenciamento seguro de usuários com autenticação JWT.
- **API RESTful**: Endpoints para manipulação de dados de usuários, diagnósticos, recomendações e progressos.
- **Integração com o PostgreSQL**: Utilização do banco de dados PostgreSQL para armazenar informações críticas de forma segura e eficiente.
- **Upload e análise de imagens**: Processamento de imagens enviadas pelos usuários para diagnósticos.

## Tecnologias Utilizadas

### Frontend
- **Flutter**: Framework para desenvolvimento multiplataforma.
- **Dart**: Linguagem de programação utilizada pelo Flutter.

### Backend
- **Laravel**: Framework PHP para desenvolvimento de APIs robustas.
- **PostgreSQL**: Sistema de gerenciamento de banco de dados relacional.

### Outros
- **Docker**: Para containerização do ambiente de desenvolvimento e produção.
- **NGINX**: Servidor web para servir a aplicação Flutter PWA.
- **Git**: Controle de versão do código fonte.
