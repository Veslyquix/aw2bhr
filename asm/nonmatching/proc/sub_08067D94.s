	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067D94
sub_08067D94: @ 0x08067D94
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _08067DD0 @ =gUnknown_085810D4
	adds r4, r5, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	movs r1, #0
	bl sub_08072C40
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xc
	bne _08067DC2
	adds r0, r5, #0
	bl Proc_Break
_08067DC2:
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08067DD0: .4byte gUnknown_085810D4

