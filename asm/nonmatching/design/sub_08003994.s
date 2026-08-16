	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08003994
sub_08003994: @ 0x08003994
	push {r4, r5, lr}
	ldr r5, _080039B4 @ =gUnknown_03001FFC
	ldrh r0, [r5]
	subs r4, r0, #1
	cmp r4, #0
	bgt _080039AA
	movs r4, #0
	ldr r0, _080039B8 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_080039AA:
	strh r4, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080039B4: .4byte gUnknown_03001FFC
_080039B8: .4byte gUnknown_03001FBC

