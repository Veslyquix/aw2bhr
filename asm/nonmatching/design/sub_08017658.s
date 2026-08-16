	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08017658
sub_08017658: @ 0x08017658
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0802150C
	ldrh r0, [r4, #0x1e]
	bl sub_08016DB8
	bl sub_08026798
	bl sub_08023348
	bl sub_0803662C
	ldr r0, _08017680 @ =gUnknown_030033EC
	ldrb r0, [r0]
	bl sub_08043DAC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017680: .4byte gUnknown_030033EC

