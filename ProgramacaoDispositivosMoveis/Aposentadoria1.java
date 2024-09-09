import java.util.Scanner;

public class Aposentadoria1 {
    public static void main(String[] args) {
        Scanner leitor = new Scanner(System.in);

        System.out.println("Digite a idade ");
        int idade = leitor.nextInt();

        System.out.println("Digite o tempo trabalhado (em anos)"); 
        int tempo = leitor.nextInt();
        
        System.out.println("Digite o sexo ");
        char sexo = leitor.next().charAt(0);

        // versão economica
        if(sexo=='m' && idade>=65 && tempo>= 30){
            System.out.println("Você já pode se aposentar");
        }
        else{
            if(sexo=='f' && idade>=60 && tempo>= 25){
                System.out.println("Você já pode se aposentar");
            }
            else{
                System.out.println("ainda não");
            }
        }


        // regras de aposentadoria
        if(sexo == 'm'){
            if(idade >= 65){
                if(tempo >= 30){
                    System.out.println("Você pode se aposentar");
                }
                else{
                    System.out.println("Trabalhe mais!");
                }
            }
            else{
                System.out.println("Você é muito novo");
            }
        }
        else{
            if(idade >= 60){
                if(tempo >= 25){
                    System.out.println("Você pode se aposentar");
                }
                else{
                    System.out.println("Trabalhe mais!");
                }
            }
            else{
                System.out.println("Você é muito novo");
            }
        }
    }
}
