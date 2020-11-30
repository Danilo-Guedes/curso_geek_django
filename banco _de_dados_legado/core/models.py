# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AditivosNutritivos(models.Model):
    nome = models.CharField(max_length=45)
    formula_quimica = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'aditivos_nutritivos'


class AditivosNutritivosPicole(models.Model):
    id_aditivo_nutritivo = models.ForeignKey(AditivosNutritivos, models.DO_NOTHING, db_column='id_aditivo_nutritivo')
    id_picole = models.ForeignKey('Picoles', models.DO_NOTHING, db_column='id_picole')

    class Meta:
        managed = False
        db_table = 'aditivos_nutritivos_picole'


class Conservantes(models.Model):
    nome = models.CharField(max_length=45)
    descricao = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'conservantes'


class ConservantesPicoles(models.Model):
    id_conservante = models.ForeignKey(Conservantes, models.DO_NOTHING, db_column='id_conservante')
    id_picole = models.ForeignKey('Picoles', models.DO_NOTHING, db_column='id_picole')

    class Meta:
        managed = False
        db_table = 'conservantes_picoles'


class Ingredientes(models.Model):
    nome = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'ingredientes'


class IngredientesPicole(models.Model):
    id_ingrediente = models.ForeignKey(Ingredientes, models.DO_NOTHING, db_column='id_ingrediente')
    id_picole = models.ForeignKey('Picoles', models.DO_NOTHING, db_column='id_picole')

    class Meta:
        managed = False
        db_table = 'ingredientes_picole'


class Lotes(models.Model):
    id_tipo_picole = models.ForeignKey('TiposPicole', models.DO_NOTHING, db_column='id_tipo_picole')
    quantidade = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'lotes'


class LotesNotaFiscal(models.Model):
    id_lote = models.ForeignKey(Lotes, models.DO_NOTHING, db_column='id_lote')
    id_nota_fiscal = models.ForeignKey('NotasFiscais', models.DO_NOTHING, db_column='id_nota_fiscal')

    class Meta:
        managed = False
        db_table = 'lotes_nota_fiscal'


class NotasFiscais(models.Model):
    data = models.DateField()
    valor = models.DecimalField(max_digits=8, decimal_places=2)
    numero_serie = models.CharField(max_length=45)
    descricao = models.CharField(max_length=200)
    id_revendedor = models.ForeignKey('Revendedores', models.DO_NOTHING, db_column='id_revendedor')

    class Meta:
        managed = False
        db_table = 'notas_fiscais'


class Picoles(models.Model):
    preco = models.DecimalField(max_digits=8, decimal_places=2)
    id_sabor = models.ForeignKey('Sabores', models.DO_NOTHING, db_column='id_sabor')
    id_tipo_embalagem = models.ForeignKey('TiposEmbalagem', models.DO_NOTHING, db_column='id_tipo_embalagem')
    id_tipo_picole = models.ForeignKey('TiposPicole', models.DO_NOTHING, db_column='id_tipo_picole')

    class Meta:
        managed = False
        db_table = 'picoles'


class Revendedores(models.Model):
    cnpj = models.CharField(max_length=45)
    razao_social = models.CharField(max_length=100)
    contato = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'revendedores'


class Sabores(models.Model):
    nome = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'sabores'


class TiposEmbalagem(models.Model):
    nome = models.CharField(max_length=45)

    def __str__(self):
        return self.nome

    class Meta:
        managed = False
        db_table = 'tipos_embalagem'
        verbose_name = ' Tipos Embalagem'
        verbose_name_plural = ' Tipos Embalagens'


class TiposPicole(models.Model):
    nome = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'tipos_picole'
