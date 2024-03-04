--Exericico 1 a) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
Declare @num int,
	@fat int

Set @num = 13
Set @fat = @num-1
While(@fat>0 and @fat<12)
Begin
set @num=@num*@fat
set @fat = @fat -1
end
if(@fat<12)
begin
print @num
end
else
begin
print 'Estouro de memoria'
end

-- exercicio 2
-- Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.
Declare @a int,
		@b int,
		@c int,
		@delta int,
		@resul1 decimal(7,2),
		@resul2 decimal(7,2)
set @a=-1
set @b=1
set @c=-6
set @delta = (@b*@b) - (4*@a*@c)

if(@delta > 0) 
begin
set @resul1 = (-@b + SQRT(@delta)) / (2*@a)
set @resul2 = (@b +SQRT(@delta)) / (2*@a)
print @resul1 
print @resul2
print @delta
end

if(@delta=0)
begin
set @resul1 = (-@b + @delta)/ (2*@a)
print @resul1
end

if (@delta<0)
begin
print 'raiz não real'
end

--Exercicio 3 c) Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo 
--que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.

Declare @ana decimal(7,2),
		@maria decimal(7,2),
		@ano int
set @ana =1.10
set @maria = 1.5
set @ano = 0
while(@ana<@maria)
begin
set @ana=@ana+0.3
set @maria=@maria+0.2
set @ano = @ano + 1
end
print 'sao necessarios ' + cast(@ano as varchar(3)) + ' anos'

--Exercicio 4 Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...
Declare @num1 int,
		@num2 int,
		@txt varchar(max)
set @num1=1
set @num2=4
set @txt=' '
while(@num1<10)
begin
--print @num1
--print @num2
--print @num2
set @txt = @txt + cast(@num1 as varchar(10)) +' , ' +  cast(@num2 as varchar(10)) + ' , ' + cast(@num2 as varchar(10)) +' , '
set @num1=@num1 +1
set @num2=@num2 +1

end
print @txt

-- Ex 4 Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste com as regras estabelecidas (Não usar constraints na criação da tabela)
Create database Sintaxes
go
use Sintaxes
go 
Create table Produto(
codigo int not null,
nome varchar(30) not null,
valor decimal(7,2) not null,
vencimento date not null
Primary Key(codigo)
)
go
Declare @cont int,
		@codigo int,
		@prod int,
		@venc decimal(7,2),
		@valor int
set @cont = 0
set @codigo = 50001
set @prod = 1
set @venc =cast(rand() * 7 + 3 as int)
set @valor =cast(rand() * 100 + 10 as decimal(7,2))

while(@cont <50)
begin
Insert into Produto Values(
@codigo,
'Produto ' +  cast(@prod as varchar(2)),
@valor,
DATEADD(DAY,@venc,GETDATE())
)
set @venc =cast(rand() * 7 + 3 as int)
set @cont = @cont + 1
set @codigo = @codigo + 1
set @prod = @prod + 1
set @valor =cast(rand() * 100 + 10 as decimal(7,2))
end

select * from Produto
