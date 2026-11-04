# clinica petvida

trabalho de banco de dados (senai). é o banco de uma clinica veterinaria inventada, feito em mysql.

## o que tem aqui

- `clinica_petvida.sql` -> cria o banco, as tabelas, enche de dados e tem as 15 consultas
- `clinica_petvida_dump.sql` -> o dump (estrutura + dados)
- `modelagem.png` -> print do diagrama

## como rodar

1. abre o mysql (terminal ou workbench)
2. roda o script:
   ```
   mysql -u root -p < clinica_petvida.sql
   ```
3. pronto, o banco `clinica_petvida` ta criado

## tabelas

clientes, especies, animais, microchips, veterinarios, especialidades, veterinario_especialidade, servicos, atendimentos, atendimento_servico

(tem 1:1, 1:n e n:n, ta tudo normalizado ate a 4fn)

## dump

```
mysqldump -u root -p --databases clinica_petvida > clinica_petvida_dump.sql
```

pra restaurar:

```
mysql -u root -p < clinica_petvida_dump.sql
```

e isso aí.
