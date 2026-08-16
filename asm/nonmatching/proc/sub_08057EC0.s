	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08057EC0
sub_08057EC0: @ 0x08057EC0
	push {r4, r5, lr}
	ldr r0, _08057ECC @ =gUnknown_03003F20
	ldr r2, [r0]
	movs r3, #0
	ldr r4, _08057ED0 @ =0x00007FFF
	b _08057EE2
	.align 2, 0
_08057ECC: .4byte gUnknown_03003F20
_08057ED0: .4byte 0x00007FFF
_08057ED4:
	lsls r1, r1, #0x10
	lsls r0, r4, #0x10
	cmp r1, r0
	bge _08057EE0
	adds r3, r2, #0
	ldrh r4, [r3, #2]
_08057EE0:
	adds r2, #4
_08057EE2:
	ldrh r1, [r2, #2]
	movs r5, #2
	ldrsh r0, [r2, r5]
	cmp r0, #0
	bge _08057ED4
	cmp r3, #0
	beq _08057EF4
	ldr r0, _08057EFC @ =0x00007FFF
	strh r0, [r3, #2]
_08057EF4:
	adds r0, r3, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08057EFC: .4byte 0x00007FFF

