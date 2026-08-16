	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08045848
sub_08045848: @ 0x08045848
	ldr r0, _08045864 @ =gUnknown_08499590
	ldr r0, [r0]
	ldr r2, _08045868 @ =0x00004184
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	ldr r1, _0804586C @ =0x0000143F
	adds r0, r0, r1
	ldrb r0, [r0]
	lsrs r0, r0, #5
	cmp r0, #1
	beq _08045870
	movs r0, #0
	b _08045872
	.align 2, 0
_08045864: .4byte gUnknown_08499590
_08045868: .4byte 0x00004184
_0804586C: .4byte 0x0000143F
_08045870:
	movs r0, #1
_08045872:
	bx lr

