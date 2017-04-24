grammar Gram;

/* This will be the entry point of our parser. */
eval:    Goal;
Number: [0-9]+ ('.' [0-9]+)?;

WS : [ \t\r\n]+ -> skip ;

Goal
	:	MainClass '(' ClassDeclaration ')'* '$'
	;
MainClass
	:	'class' Identifier '{' 'public' 'static' 'void' 'main' '(' 'String' 
		'[' ']' Identifier ')' '{' Statement '}' '}'
	;
ClassDeclaration
	:	'class' Identifier ( 'extends' Identifier )? '{' ( VarDeclaration )* 
		( MethodDeclaration )* '}' 	
	;
VarDeclaration 
	: Type Identifier ';'
	;
MethodDeclaration
	: 'public' Type Identifier '(' ( Type Identifier (',' Type Identifier)*)? ')' '{'
		( VarDeclaration )* (Statement)* 'return' Expression ';''}'
	;
Type
	:	'int' '[' ']'  
	|	'boolean'
	|	'int'
	|	Identifier
	;
Statement
	:	'{'(Statement)* '}'
	|	'if' '(' Expression ')' Statement 'else' Statement
	|	'while' '(' Expression ')' Statement
	|	'System.out.println' '(' Expression ')'';'
	|	Identifier '=' Expression ';'
	|	Identifier '[' Expression ']' '=' Expression ';'
	;
Expression
	:
		Expression ( '&&' | '<' | '+' | '-' | '*' ) Expression
	|
		Expression '[' Expression ']'
	|
		Expression '.' 'length'
	|
		Expression '.' Identifier '(' ( Expression ( ',' Expression )* )? ')'
	|
		[1-9][0-9]*|[0]
	|
		'true'
	|
		'false'
	|
		Identifier
	|
		'this'
	|
		'new' 'int' '[' Expression ']'
	|
		'new' Identifier '(' ')'
	|
		'!' Expression
	|
		'(' Expression ')'
	;
Alphanumeric
	:	[a-zA-Z]|[0-9];
Identifier
	:
		[a-zA-Z]({Alphanumeric})*
	;

