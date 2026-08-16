	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08013580
sub_08013580: @ 0x08013580
	push {lr}
	ldr r0, _0801359C @ =gUnknown_03000048
	ldrb r0, [r0]
	cmp r0, #1
	bne _08013598
	ldr r0, _080135A0 @ =gPal
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #3
	bl sub_08011C68
_08013598:
	pop {r0}
	bx r0
	.align 2, 0
_0801359C: .4byte gUnknown_03000048
_080135A0: .4byte gPal

