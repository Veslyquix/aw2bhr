	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08018A28
sub_08018A28: @ 0x08018A28
	adds r2, r0, #0
	ldr r0, _08018A58 @ =gUnknown_030032D8
	ldrh r0, [r0]
	cmp r0, #0xc
	bne _08018A54
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	cmp r0, #0
	blt _08018A46
	ldr r0, _08018A5C @ =gUnknown_03004080
	ldrh r1, [r0]
	movs r3, #0x12
	ldrsh r0, [r2, r3]
	cmp r1, r0
	bne _08018A54
_08018A46:
	ldr r0, _08018A60 @ =gUnknown_030033EC
	ldrh r0, [r0]
	ldrb r1, [r2, #0x11]
	cmp r0, r1
	bne _08018A54
	movs r0, #0
	str r0, [r2, #8]
_08018A54:
	bx lr
	.align 2, 0
_08018A58: .4byte gUnknown_030032D8
_08018A5C: .4byte gUnknown_03004080
_08018A60: .4byte gUnknown_030033EC

