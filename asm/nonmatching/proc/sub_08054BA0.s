	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08054BA0
sub_08054BA0: @ 0x08054BA0
	ldr r2, _08054BBC @ =gUnknown_08136148
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08054BC8
	ldr r1, _08054BC0 @ =gUnknown_03004524
	ldrh r0, [r1]
	cmp r0, #0
	bne _08054BC4
	movs r0, #8
	b _08054BC6
	.align 2, 0
_08054BBC: .4byte gUnknown_08136148
_08054BC0: .4byte gUnknown_03004524
_08054BC4:
	subs r0, #1
_08054BC6:
	strh r0, [r1]
_08054BC8:
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08054BE8
	ldr r1, _08054BE0 @ =gUnknown_03004524
	ldrh r0, [r1]
	cmp r0, #8
	bne _08054BE4
	movs r0, #0
	b _08054BE6
	.align 2, 0
_08054BE0: .4byte gUnknown_03004524
_08054BE4:
	adds r0, #1
_08054BE6:
	strh r0, [r1]
_08054BE8:
	ldr r0, [r2]
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _08054BFE
	ldr r0, _08054C00 @ =gUnknown_03004514
	ldrh r1, [r0]
	movs r2, #1
	eors r1, r2
	strh r1, [r0]
_08054BFE:
	bx lr
	.align 2, 0
_08054C00: .4byte gUnknown_03004514

