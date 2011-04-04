#!/usr/bin/perl

use XML::XPath;

my $inputFile = shift;

die("Faltou passar o nome do arquivo!") unless defined($inputFile);

my $xpath = XML::XPath->new(filename => $inputFile);

my $nodeset = $xpath->find('//Biblioteca/Livro');

foreach my $context ($nodeset->get_nodelist) {
	print "----------------------------------------------------\n";
	my $isbn = $xpath->findvalue('@ISBN', $context);
	print "ISBN: $isbn\n";
	my $ano = $xpath->findvalue('@Ano', $context);
	print "Ano de Publicação: $ano\n";
	my $paginas = $xpath->findvalue('Paginas', $context);
	print "Quantidade de Páginas: $paginas\n";
	my $titulo = $xpath->findvalue('Titulo', $context);
	print "Título: $titulo\n";
	my $exemplares = $xpath->find('Exemplares/Codigo', $context);
	print "Exemplares disponíveis:\n";
	foreach my $newcontext ($exemplares->get_nodelist){
		my $codigo = $xpath->findvalue('.', $newcontext);
		print "\tCódigo: $codigo\n";
	}
}
print "----------------------------------------------------\n";
