# Helpful Books - Assistente de Manutenção para Windows

Este repositório contém um script de manutenção (`.bat`) projetado para executar uma série de otimizações de software em sistemas operacionais Windows 10 e 11. O objetivo é ajudar usuários e profissionais a manterem o computador mais rápido e estável de forma automatizada.

O script foi desenvolvido pela equipe da [Helpful Books](https://hotmart.com/pt-br/marketplace/produtos/manutencao-preventiva-de-pcs-e-book-ilustrado-para-usuarios-e-profissionais/L100220207D) e é executado em Português do Brasil.

## Funcionalidades Principais

O "Assistente de Manutenção" realiza as seguintes tarefas de forma sequencial:

* **Verificação de Privilégios**: Garante que o script seja executado com privilégios de Administrador.
* **Criação de Ponto de Restauração**: Cria um ponto de restauração do sistema chamado `ManutencaoHelpFulBooks` antes de iniciar as modificações.
* [cite_start]**Verificação de Arquivos de Sistema**: Executa o `sfc /scannow` para verificar e reparar arquivos corrompidos do sistema[cite: 4].
* [cite_start]**Verificação da Imagem do Windows**: Utiliza o comando `dism /online /cleanup-image /checkhealth` para verificar a integridade da imagem do sistema[cite: 5].
* [cite_start]**Limpeza de Arquivos Temporários**: Remove arquivos desnecessários das pastas temporárias do usuário e do Windows[cite: 6].
* [cite_start]**Limpeza de Cache de Navegadores**: Limpa o cache dos navegadores Microsoft Edge, Google Chrome e Mozilla Firefox[cite: 7, 13].
* [cite_start]**Limpeza de Disco**: Executa a ferramenta de Limpeza de Disco do Windows (`cleanmgr`) de forma automatizada[cite: 8].
* **Limpeza de Cache DNS**: Limpa o cache de resolução de DNS do sistema com `ipconfig /flushdns`.
* [cite_start]**Limpeza de Cache do Windows Update**: Interrompe os serviços relacionados e remove os arquivos de instalação antigos do Windows Update para liberar espaço[cite: 9].

## Como Usar

1.  **Baixe o Script**: Faça o download do arquivo `script_manutencao.bat` deste repositório.
2.  **Execute como Administrador**: Clique com o botão direito do mouse sobre o arquivo `script_manutencao.bat` e selecione a opção **"Executar como administrador"**.
3.  **Aguarde a Conclusão**: O script executará todas as etapas automaticamente. [cite_start]Ao final, uma mensagem de "Manutenção concluída!" será exibida[cite: 10].
4.  [cite_start]**Feche a Janela**: Pressione qualquer tecla para fechar a janela do prompt de comando[cite: 11].

**Atenção:** É crucial executar o script com privilégios de administrador para que todas as funções de limpeza e verificação operem corretamente.

## Requisitos

* [cite_start]**Sistema Operacional**: Windows 10 ou Windows 11[cite: 12].
* **Permissões**: Acesso de Administrador.

## Aviso Legal

Este script foi criado para automatizar tarefas de manutenção comuns e é utilizado por sua conta e risco. Embora inclua a criação de um ponto de restauração como medida de segurança, recomenda-se que você tenha um backup de seus dados importantes antes de executar qualquer ferramenta de manutenção.

## Como Contribuir

Sinta-se à vontade para abrir *issues* para relatar bugs ou sugerir melhorias. Se desejar contribuir com o código, por favor, faça um *fork* do repositório e envie um *pull request*.

## Licença

Este projeto é de código aberto e está disponível sob a [Licença MIT](https://opensource.org/licenses/MIT).
