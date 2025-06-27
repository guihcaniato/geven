NIASSELVI 

Curso (TURMA) – Nome da disciplina 

 

BANCO DE DADOS PARA SISTEMA DE GERENCIAMENTO DE EVENTOS 

Autor(es): Guilherme Caniato1 

Tutor externo: Nome do Orientador2 

MOTIVO DA ESCOLHA DO OBJETO DE ESTUDO 
A família de minha namorada empreende em um Buffet, que atende eventos locais, como casamentos, jantares executivos e empresariais, aniversários, entre outras comemorações. Em um jantar de uma associação, vi a necessidade de controlar a entrada de convidados, visto que os convites eram pagos, mas não havia um controle efetivo de quem adquiria o convite. Assim, a ideia é ter um sistema que gerencie os eventos realizados, e gere tickets/convites para o evento, tendo o organizador o controle dos convidados. Este é um esboço inicial, onde temos as tabelas bases do objeto de estudo. Neste momento, o foco é somente o gerenciamento, e em uma segunda fase, criar o sistema de cobrança por ticket. 

ESTRATÉGIAS DE ANÁLISE DO OBJETO 

 

Como descrito no motivo da escolha do objeto, a necessidade foi notada em um acontecimento. Para entender essa necessidade, foi realizada entrevista com as pessoas responsáveis pelo Buffet, onde buscou-se entender qual a maior dor no que tange o controle de convidados de festas. Também se viu nisso uma oportunidade: vender este sistema junto ao contrato do serviço do Buffet. 

Para desenvolvimento e implementação foram utilizadas ferramentas como o BRModelo, para desenho do Diagrama Entidade-Relacionamento, MySQL Workbench e Datagrip para o desenvolvimento do banco de dados, utilizando o MySQL como tecnologia de banco de dados. Tudo isso foi desenvolvido dentro do SO Ubuntu/Linux, como servidor. 

 

CONSIDERAÇÕES CRÍTICAS E CRIATIVAS 

 

No início, foi realizado o levantamento de requisitos, e tendo isso em vista, foi desenvolvido o seguinte DER (Diagrama Entidade-Relacionamento), e modelo lógico:Imagem 

Imagem 

Nestes diagramas vemos que o usuário ou o PJ (Pessoa Jurídica) pode ser organizador do evento. Porém, no sistema, todo evento com PJ como responsável tem que ter um usuário pessoa física para gerenciar o evento. Todo evento pode ter um local e um tipo de evento. A pessoa física reside em um endereço e possui uma nacionalidade. Também deve ser vinculado algum estado civil. Os locais de evento também precisam ser vinculados a cidade. 

Foi implementado um sistema de tabela de endereços, em que o id do município e do estado foi incluído com base nos códigos do IBGE. Também foi desenvolvida uma procedure dentro do banco onde gera um código alfanumérico de 12 digitos, responsável por identificar os tickets criados no banco, e a ferramenta que cria esses tickets. O dump deste banco pode ser consultado através do link https://github.com/guihcaniato/geven. 
