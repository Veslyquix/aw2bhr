	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804AF88
sub_0804AF88: @ 0x0804AF88
	ldr r0, _0804AFA4 @ =gUnknown_02028E48
	ldrb r0, [r0]
	cmp r0, #0
	bne _0804AF9C
	ldr r0, _0804AFA8 @ =gUnknown_030044E0
	ldr r0, [r0]
	adds r0, #0x5c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804AFA2
_0804AF9C:
	ldr r1, _0804AFAC @ =gUnknown_03002F1C
	movs r0, #1
	strh r0, [r1]
_0804AFA2:
	bx lr
	.align 2, 0
_0804AFA4: .4byte gUnknown_02028E48
_0804AFA8: .4byte gUnknown_030044E0
_0804AFAC: .4byte gUnknown_03002F1C

