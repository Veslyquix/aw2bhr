	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08058224
sub_08058224: @ 0x08058224
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08058248 @ =gUnknown_030033EC
	ldrh r0, [r5]
	ldrb r1, [r4]
	bl sub_08042D1C
	ldrb r1, [r4, #6]
	lsls r2, r1, #0x19
	lsrs r1, r2, #0x19
	cmp r0, r1
	bgt _0805824C
	ldrh r0, [r5]
	ldrb r1, [r4]
	bl sub_08042D1C
	b _0805824E
	.align 2, 0
_08058248: .4byte gUnknown_030033EC
_0805824C:
	lsrs r0, r2, #0x19
_0805824E:
	pop {r4, r5}
	pop {r1}
	bx r1

