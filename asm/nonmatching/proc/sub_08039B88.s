	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08039B88
sub_08039B88: @ 0x08039B88
	push {lr}
	ldr r0, _08039BA4 @ =gUnknown_0849D84C
	bl Proc_Find
	cmp r0, #0
	bne _08039BAC
	ldr r0, _08039BA8 @ =gUnknown_0849D874
	bl Proc_Find
	cmp r0, #0
	bne _08039BAC
	movs r0, #0
	b _08039BAE
	.align 2, 0
_08039BA4: .4byte gUnknown_0849D84C
_08039BA8: .4byte gUnknown_0849D874
_08039BAC:
	movs r0, #1
_08039BAE:
	pop {r1}
	bx r1
	.align 2, 0

