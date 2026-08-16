	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0804A0A0
sub_0804A0A0: @ 0x0804A0A0
	push {lr}
	ldr r0, _0804A0B8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r0, [r0, #4]
	cmp r0, #0x40
	beq _0804A108
	cmp r0, #0x40
	bgt _0804A0BC
	cmp r0, #1
	beq _0804A0C2
	b _0804A11A
	.align 2, 0
_0804A0B8: .4byte gpKeySt
_0804A0BC:
	cmp r0, #0x80
	beq _0804A0F4
	b _0804A11A
_0804A0C2:
	movs r0, #0x71
	bl sub_0803B4DC
	ldr r2, _0804A0E8 @ =gUnknown_0200C420
	ldrb r0, [r2, #8]
	movs r1, #0x3f
	ands r1, r0
	ldr r0, _0804A0EC @ =gUnknown_02028E40
	ldrb r0, [r0]
	lsls r0, r0, #6
	orrs r1, r0
	strb r1, [r2, #8]
	ldr r0, _0804A0F0 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	bl sub_0804A010
	b _0804A11A
	.align 2, 0
_0804A0E8: .4byte gUnknown_0200C420
_0804A0EC: .4byte gUnknown_02028E40
_0804A0F0: .4byte gUnknown_03001FBC
_0804A0F4:
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r0, _0804A104 @ =gUnknown_02028E40
	ldrb r1, [r0]
	adds r1, #1
	b _0804A114
	.align 2, 0
_0804A104: .4byte gUnknown_02028E40
_0804A108:
	movs r0, #0x67
	bl sub_0803B4DC
	ldr r0, _0804A120 @ =gUnknown_02028E40
	ldrb r1, [r0]
	subs r1, #1
_0804A114:
	movs r2, #3
	ands r1, r2
	strb r1, [r0]
_0804A11A:
	pop {r0}
	bx r0
	.align 2, 0
_0804A120: .4byte gUnknown_02028E40

