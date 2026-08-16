	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0802571C
sub_0802571C: @ 0x0802571C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08025740 @ =gUnknown_08499594
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r2]
	adds r0, r0, r1
	ldrb r1, [r0, #2]
	ldrb r2, [r0, #3]
	bl sub_080255F4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	pop {r1}
	bx r1
	.align 2, 0
_08025740: .4byte gUnknown_08499594

