public class Calculadora {
    // Método para adicionar histórico ao Salesforce
    public void adicionarHistorico(Decimal num1, Decimal num2, String operacao, Decimal resultado) {
        historico__c h = new historico__c();
        h.num1__c = num1;
        h.num2__c = num2;
        h.operacao__c = operacao;
        h.resultado__c = resultado;
        h.his__c = num1 + ' ' + operacao + ' ' + num2 + ' = ' + resultado;

       insert h;
    }

    public Decimal somar(Decimal num1, Decimal num2) {
        Decimal resultado = num1 + num2;
        adicionarHistorico(num1, num2, '+', resultado);
        return resultado;
    }

    public Decimal subtrair(Decimal num1, Decimal num2) {
        Decimal resultado = num1 - num2;
        adicionarHistorico(num1, num2, '-', resultado);
        return resultado;
    }

    public Decimal dividir(Decimal num1, Decimal num2) {
        Decimal resultado = num1 / num2;
        adicionarHistorico(num1, num2, '/', resultado);
        return resultado;
    }

    public Decimal multiplicar(Decimal num1, Decimal num2) {
        Decimal resultado = num1 * num2;
        adicionarHistorico(num1, num2, '*', resultado);
        return resultado;
    }

    public void exibirHistorico() {
        // Para o histórico já gravado no Salesforce, você pode consultar os registros
        List<historico__c> historicoRecords = [SELECT num1__c, num2__c, operacao__c, resultado__c, his__c FROM historico__c];
        for (historico__c h : historicoRecords) {
            System.debug(h.his__c);
        }
    }
}



