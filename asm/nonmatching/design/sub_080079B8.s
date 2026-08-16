	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_080079B8
sub_080079B8: @ 0x080079B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080079E8 @ =gUnknown_0200B0B0
	ldr r0, [r0]
	movs r2, #0x3a
	ldrsh r1, [r0, r2]
	movs r3, #7
	ldrsb r3, [r0, r3]
	adds r2, r1, #3
	cmp r3, #0
	bne _080079D0
	adds r2, r1, #4
_080079D0:
	cmp r2, #9
	ble _080079D6
	subs r2, #0xa
_080079D6:
	cmp r3, #0
	bne _080079EC
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #4
	b _080079F6
	.align 2, 0
_080079E8: .4byte gUnknown_0200B0B0
_080079EC:
	adds r0, #0x38
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #3
_080079F6:
	ldr r1, _08007A08 @ =gUnknown_0200B0D0
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	strh r4, [r0, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007A08: .4byte gUnknown_0200B0D0

