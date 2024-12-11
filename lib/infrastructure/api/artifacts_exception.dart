import 'package:equatable/equatable.dart';

class ArtifactsException with EquatableMixin implements Exception {
  final String errorMessage;

  ArtifactsException({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class NetworkArtifactsException extends ArtifactsException {
  final ErrorType errorType;
  final Exception? parent;

  NetworkArtifactsException(this.errorType, {this.parent})
      : super(
          errorMessage:
              'Error ${errorType.code} (${errorType.name}) ${parent ?? ''}',
        );

  @override
  List<Object?> get props => [...super.props, errorType, parent,];
}

enum ErrorType {
  // General errors
  unknown(400),
  invalidPayload(422),
  tooManyRequests(429),
  notFound(404),
  fatalError(500),

  // Account errors
  tokenInvalid(452),
  tokenExpired(453),
  tokenMissing(454),
  tokenGenerationFail(455),
  usernameAlreadyUsed(456),
  emailAlreadyUsed(457),
  samePassword(458),
  currentPasswordInvalid(459),

  // Character errors
  notEnoughHp(483),
  maxUtilitiesEquiped(484),
  itemAlreadyEquiped(485),
  locked(486),
  notThisTask(474),
  tooManyItemsTask(475),
  noTask(487),
  taskNotCompleted(488),
  alreadyTask(489),
  alreadyMap(490),
  slotEquipmentError(491),
  goldInsufficient(492),
  notSkillLevelRequired(493),
  nameAlreadyUsed(494),
  maxCharactersReached(495),
  notLevelRequired(496),
  inventoryFull(497),
  characterNotFound(498),
  inCooldown(499),

  // Item errors
  insufficientQuantity(471),
  invalidEquipment(472),
  recyclingInvalidItem(473),
  invalidConsumable(476),
  missingItem(478),

  // Grand exchange errors
  geMaxQuantity(479),
  geNotInStock(480),
  geNotThePrice(482),
  geTransactionInProgress(436),
  geNoOrders(431),
  geMaxOrders(433),
  geTooManyItems(434),
  geSameAccount(435),
  geInvalidItem(437),
  geNotYourOrder(438),

  // Bank errors
  bankInsufficientGold(460),
  bankTransactionInProgress(461),
  bankFull(462),

  // Map errors
  mapNotFound(597),
  mapContentNotFound(498),
  ;

  final int code;

  const ErrorType(this.code);
}
