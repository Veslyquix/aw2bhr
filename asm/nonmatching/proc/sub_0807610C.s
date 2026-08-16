	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807610C
sub_0807610C: @ 0x0807610C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08075EC4
	adds r1, r0, #0
	adds r2, r4, #0
	adds r2, #0x3a
	strb r1, [r2]
	lsls r0, r1, #0x18
	cmp r0, #0
	bne _08076128
	movs r0, #0xff
	orrs r1, r0
	strb r1, [r2]
_08076128:
	adds r0, r4, #0
	bl sub_08075F44
	ldr r0, _08076148 @ =gUnknown_0202FDFC
	ldrh r1, [r0]
	ldrh r2, [r0, #4]
	adds r1, r1, r2
	strh r1, [r4, #0x36]
	ldrh r1, [r0, #2]
	ldrh r0, [r0, #6]
	adds r1, r1, r0
	strh r1, [r4, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076148: .4byte gUnknown_0202FDFC

