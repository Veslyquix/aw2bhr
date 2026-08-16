	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041FE0
sub_08041FE0: @ 0x08041FE0
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804202C @ =gUnknown_085D5ABC
	ldrb r2, [r4]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r0, r1
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	beq _08042034
	ldr r0, _08042030 @ =gUnknown_08499594
	ldr r1, [r0]
	subs r1, r4, r1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	adds r0, r0, r1
	lsls r1, r0, #8
	adds r0, r0, r1
	lsls r1, r0, #0x10
	adds r0, r0, r1
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r0, #1
	adds r1, r2, #0
	bl sub_08042D50
	cmp r0, #1
	bgt _08042026
	ldrh r1, [r4, #4]
	movs r0, #0xf0
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08042034
_08042026:
	movs r0, #0
	b _08042036
	.align 2, 0
_0804202C: .4byte gUnknown_085D5ABC
_08042030: .4byte gUnknown_08499594
_08042034:
	movs r0, #1
_08042036:
	pop {r4}
	pop {r1}
	bx r1

