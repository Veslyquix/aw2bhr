	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080323D4
sub_080323D4: @ 0x080323D4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r2, _08032418 @ =gUnknown_08090D24
	ldr r0, [r2]
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0xa]
	movs r4, #3
	adds r5, r2, #0
_080323E6:
	lsls r0, r4, #0x18
	asrs r0, r0, #0x18
	bl sub_0802F460
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08032406
	ldr r0, _0803241C @ =gUnknown_0300449C
	adds r0, r4, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _08032406
	ldr r0, [r5]
	ldr r0, [r0]
	strh r4, [r0, #6]
	strh r4, [r0, #4]
_08032406:
	subs r4, #1
	cmp r4, #0
	bge _080323E6
	movs r0, #0
	str r0, [r6, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08032418: .4byte gUnknown_08090D24
_0803241C: .4byte gUnknown_0300449C

