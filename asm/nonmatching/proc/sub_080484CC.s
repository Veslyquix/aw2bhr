	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080484CC
sub_080484CC: @ 0x080484CC
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldr r0, _080484E8 @ =gpKeySt
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _08048528
	ldrb r0, [r6, #0x1f]
	ldr r7, _080484EC @ =gUnknown_0812A140
	b _080484F6
	.align 2, 0
_080484E8: .4byte gpKeySt
_080484EC: .4byte gUnknown_0812A140
_080484F0:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_080484F6:
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08048512
	ldr r0, _08048524 @ =gUnknown_02028DD8
	adds r0, r4, r0
	ldrb r5, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0804769C
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _080484F0
_08048512:
	strh r5, [r6, #0x28]
	movs r0, #0x65
	bl sub_0803B4DC
	ldr r0, [r7]
	ldrb r0, [r0]
	bl sub_08015C30
	b _08048552
	.align 2, 0
_08048524: .4byte gUnknown_02028DD8
_08048528:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804854C
	movs r0, #0x66
	bl sub_0803B4DC
	ldr r0, _08048544 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	ldr r0, _08048548 @ =gUnknown_03002F1C
	strh r4, [r0]
	b _08048552
	.align 2, 0
_08048544: .4byte gUnknown_03001FBC
_08048548: .4byte gUnknown_03002F1C
_0804854C:
	adds r0, r6, #0
	bl sub_080482D8
_08048552:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

