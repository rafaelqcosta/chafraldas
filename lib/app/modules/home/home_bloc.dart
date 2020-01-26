import 'package:flutter_modular/flutter_modular.dart';

import 'package:universal_html/html.dart' as html;

class HomeBloc extends Disposable {
  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    valor = 20;
    quantidade = 1;
  }

  int valor = 20;
  int valorDaFralda = 20;
  int quantidade = 1;

  void add() {
    quantidade += quantidade != 20 ? 1 : 0;
    valor = valorDaFralda * quantidade;
  }

  void remove() {
    quantidade -= quantidade != 1 ? 1 : 0;
    valor = valorDaFralda * quantidade;
  }

  String linkPagamento = '';
  Future<void> doar() async {
    quantidadeSelecionada();
    html.window.open(linkPagamento, '_self');
    // quantidadeSelecionada();
    // if (await canLaunch(linkPagamento) != null) {
    //   await launch(linkPagamento);
    // }
  }

  void quantidadeSelecionada() {
    switch (quantidade) {
      case 1:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/6ca55cca-2112-4cde-804f-aea353623234';
        break;
      case 2:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/337c1d72-b360-480c-9dee-80471fb41ed8';
        break;
      case 3:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/6a26f65b-6bad-4390-8f76-ac7084587c95';
        break;
      case 4:
        linkPagamento =
            'hhttps://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/8a48af1b-c8cb-4eec-9f26-3430098b656d';
        break;
      case 5:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/f8ea3d7f-dfb2-4a10-94e7-d60dce8d86db';
        break;
      case 6:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/f4dbb05d-8e50-4a47-b9ad-7eec1f65f6d9';
        break;
      case 7:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/056e63eb-895f-473a-8d2d-6c109db071f1';
        break;
      case 8:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/fadf6e15-5ae9-4e9b-8fbd-006bf577eb91';
        break;
      case 9:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/03eab87f-cfa2-44ed-8951-966447667b7a';
        break;
      case 10:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/5843652f-35e2-431d-aecf-e231f71377db';
        break;
      case 11:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/a5feb1ca-541a-4507-8cd9-484cf6f66956';
        break;
      case 12:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/eaf8e938-c931-4149-8be2-0a66af832465';
        break;
      case 13:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/cac0d093-6536-4533-a24e-fb36db9ab515';
        break;
      case 14:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/419ce4d9-c643-4fb2-851d-30a01086592b';
        break;
      case 15:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/f776c41e-c76e-4ae1-98ae-fd48cf95e85f';
        break;
      case 16:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/6fe7f9ed-3742-48ae-bc6f-be15da323899';
        break;
      case 17:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/a16a382c-743d-484f-a766-cd3abdc82a11';
        break;
      case 18:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/86504c8d-9468-4597-bf81-de418b90ec05';
        break;
      case 19:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/1c5f988a-ec96-42ad-b577-c05e4e00f421';
        break;
      case 20:
        linkPagamento =
            'https://cieloecommerce.cielo.com.br/transactionalvnext/order/buynow/813d8ce2-24a3-4f51-bdcd-fb23124b7123';
        break;
      default:
    }
  }
}
