Curso Agregação de Logs com Promtail, Grafana, e Loki no nextwave(LuisDEV)

### Conteúdo 
 - Arquitetura de observabilidade Log
 - Loki
   - Labels
   - Cardinalidade
   - Multi-tenancy
   - LogQL
   - Modos de Deployment
 - Promtail
 - Grafana
   - Dashboards
 - Hands-on

### Loki
 - Loki é uma aplicação open-source de agregação de logs desenvolvida e mantida pela Grafana Labs
 - É desenvolvido na ideia de indexar apenas o metadados dos logs, lalels
 - Os logs são comprimidos e armazenados em pedaços em sistemas de armazenamento como AWS Bucket S3, Google Cloud Storage ou sistema de arquivo local.

### Label
 - Label são pares de chave-valor asssim como noPrometheus
 - A combinação de chave-valor de label gera um novo stream
 - Boas praticas
   - Utilizar labels estáticas, ex: host, environment, app
   - Utilizar labels dinâmicas tem um custo de performance para o Loki

 ### Cardinalidade
  - É a quantidade de valores únicos existente

### Multi-tenancy
 - Grafana é uma plataforma que permite isolar os dados de cada tenant
 - As requisições devem incluir o Header X-Scope-OrgId

### LogQL
 - Existem 2 tipos de queries:
   - Log queries: retornam linhas de log
   - Metric queries: é possivel realizar cálculos com base no resultado obtido da consulta de log queries
 - sum(rate({app="foo"}[1m])

### Modos de Deployment
 - Monolitico Escalavel
 - Monolitico
 - Microservice

### Promtail
 - É um agente que coleta os logs do servidor local e envia para o Loki
 - O Promtail roda em cada maquina que precisa ser monitorada, filtra, transforma e enriquece o log

### Grafana
 - É uma plataforma utilizada para análise e criação de dashboards
 - Suporte a integração com vários tipos de banco de dados
 - OpenSource e SaaS

### Boas práticas

### Niveis de Logs
 - Error: Precisa de atenção imediata, ocorreu alguma falha no sistema e o processo/fluxo foi impactado
 - Warn: Ocorreram falhas no sistema e mesmo assim o processo/fluxo pode continuar
 - Info: Informações de negocio e de fluxo interessantesao monitoramento
 - Debug: Informações de negocio/fluxo importantes para monitoramento

### Mensagens de log
 - Sempre escrever mensagens de log que façam sentido
   - Erro ao salvar usuario user.name no banco de ddos database.name request.return
   - ao contrario de Erro ao salvar no banco de dados

### Estrutura de log
 - Utilizar uma estrutura de log no formato json é melhor para parsear e realizar consultas
 - Possua uma estrutura bem definida com todas as aplicações da empresa para que tenham melhores beneficios ao realizarem algum trobleshooting
