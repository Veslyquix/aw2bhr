	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08043898
sub_08043898: @ 0x08043898
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r3, r1, #0
	ldr r0, _080438CC @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1e]
	cmp r0, #1
	beq _080438B6
	cmp r0, #2
	beq _080438D8
_080438B6:
	adds r2, r3, #0
	adds r2, #0x18
	ldr r3, _080438D0 @ =gUnknown_084A0052
	ldr r0, _080438D4 @ =0x0000702F
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSprite
	b _080438EA
	.align 2, 0
_080438CC: .4byte gUnknown_08499598
_080438D0: .4byte gUnknown_084A0052
_080438D4: .4byte 0x0000702F
_080438D8:
	adds r2, r3, #0
	adds r2, #0x18
	ldr r3, _080438F4 @ =gUnknown_084A005A
	ldr r0, _080438F8 @ =0x00007033
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSprite
_080438EA:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080438F4: .4byte gUnknown_084A005A
_080438F8: .4byte 0x00007033

