import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodorder/model/logopembayaran.dart';
import 'package:intl/intl.dart';

final listLogoPembayaran = Provider(
  (ref) => [
    LogoPembayaranModel(
      name: 'Dana',
      path: 'assets/logo/dana.png',
      deskripsi: 'Pembayaran instan dengan e-wallet Dana',
    ),
    LogoPembayaranModel(
      name: 'Gopay',
      path: 'assets/logo/gopay.png',
      deskripsi: 'Bayar cepat dan praktis langsung dari saldo GoPay',
    ),
    LogoPembayaranModel(
      name: 'QRIS',
      path: 'assets/logo/qris.png',
      deskripsi: 'Satu kode QR untuk semua pembayaran',
    ),
    LogoPembayaranModel(
      name: 'Shopee Pay',
      path: 'assets/logo/shopee_pay.png',
      deskripsi: 'Transaksi mudah dengan ShopeePay',
    ),
  ],
);

final providerMethodPembayaran = StateProvider<int>((ref) => 0);

final providerFormatHargaPembayaran = StateProvider.family<String, int>((
  ref,
  arg,
) {
  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  return formatCurrency(arg);
});
