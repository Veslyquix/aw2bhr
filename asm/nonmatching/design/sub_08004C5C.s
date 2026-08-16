	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08004C5C
sub_08004C5C: @ 0x08004C5C
	push {r4, lr}
	ldr r4, _08004C9C @ =gUnknown_0200B0B0
	ldr r1, [r4]
	movs r0, #0
	strb r0, [r1, #6]
	ldr r1, [r4]
	movs r0, #1
	strh r0, [r1, #2]
	bl sub_08003704
	ldr r1, [r4]
	adds r2, r1, #0
	adds r2, #0x46
	movs r0, #0x15
	strh r0, [r2]
	adds r1, #0x48
	movs r0, #0x10
	strh r0, [r1]
	movs r0, #0x70
	bl sub_0801B780
	movs r0, #0x10
	movs r1, #0x10
	bl sub_08022AD0
	bl sub_08001D9C
	bl sub_08003948
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08004C9C: .4byte gUnknown_0200B0B0

