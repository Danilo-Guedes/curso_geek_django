from random import randint
from django.views.generic import TemplateView
from chartjs.views.lines import BaseLineChartView


class IndexView(TemplateView):
    template_name = 'index.html'


class DadosJSONView(BaseLineChartView):

    def get_labels(self):
        """Retorna 12 labels para a representação do x"""
        labels = [
            "Janeiro",
            "Fevereiro",
            "Março",
            "Abril",
            "Maio",
            "Junho",
            "Julho",
            "Agosto",
            "Setembro",
            "Outubro",
            "Novembro",
            "Dezembro"
        ]

        return labels

    def get_providers(self):
        """Retorna os nomes dos datasets."""
        datasets = [
            "Programação para Leigos",
            "Algoritmos e Lógica de Programação",
            "Programação em C",
            "Programação em Java",
            "Programação em Python",
            "Banco de Dados"
        ]
        return datasets

    def get_data(self):
        """
        Retorna 6 datasets para plotar o gráfico.

        Cada linha representa um dataset.
        Cada coluna representa um label.

        A quantidade de dados precisa ser igual aos datasets/labels

        12 labels, então 12 colunas.
        6 datasets, então 6 linhas.
        """
        dados = []
        for l in range(6):
            for c in range(12):
                dado = [
                    randint(1, 100),  # jan
                    randint(1, 100),  # fev
                    randint(1, 100),  # mar
                    randint(1, 100),  # abr
                    randint(1, 100),  # mai
                    randint(1, 100),  # jun
                    randint(1, 100),  # jul
                    randint(1, 100),  # ago
                    randint(1, 100),  # set
                    randint(1, 100),  # out
                    randint(1, 100),  # nov
                    randint(1, 100)   # dez
                ]
            dados.append(dado)
        return dados

