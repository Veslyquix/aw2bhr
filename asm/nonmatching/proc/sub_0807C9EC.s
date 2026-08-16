	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C9EC
sub_0807C9EC: @ 0x0807C9EC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #9
	bl sub_08043B44
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	movs r0, #0x78
	str r0, [r4, #0x34]
	str r1, [r4, #0x38]
	str r1, [r4, #0x2c]
	str r1, [r4, #0x30]
	bl sub_0807F8E4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	beq _0807CA90
	ldr r0, _0807CA84 @ =gUnknown_086165C0
	bl Proc_Find
	adds r2, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	subs r1, #4
	strh r0, [r1]
	ldr r0, [r2, #0x58]
	str r0, [r4, #0x58]
	ldr r0, [r2, #0x5c]
	str r0, [r4, #0x5c]
	ldr r0, [r2, #0x60]
	str r0, [r4, #0x60]
	adds r0, r2, #0
	adds r0, #0x64
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	ldr r0, [r2, #0x40]
	str r0, [r4, #0x40]
	adds r0, r2, #0
	adds r0, #0x48
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x68
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	adds r1, r4, #0
	adds r1, #0x6a
	strh r0, [r1]
	ldr r5, _0807CA88 @ =gUnknown_081D9340
	ldr r1, _0807CA8C @ =gUnknown_081D9344
	b _0807CACE
	.align 2, 0
_0807CA84: .4byte gUnknown_086165C0
_0807CA88: .4byte gUnknown_081D9340
_0807CA8C: .4byte gUnknown_081D9344
_0807CA90:
	adds r0, r4, #0
	adds r0, #0x52
	strh r1, [r0]
	subs r0, #4
	strh r1, [r0]
	str r1, [r4, #0x58]
	str r1, [r4, #0x5c]
	str r1, [r4, #0x60]
	adds r0, #0x16
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	str r1, [r4, #0x40]
	subs r0, #0x1e
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x68
	movs r0, #4
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strh r0, [r1]
	ldr r5, _0807CAF0 @ =gUnknown_081D9340
	ldr r1, _0807CAF4 @ =gUnknown_081D9344
	ldr r3, _0807CAF8 @ =gUnknown_03005950
	movs r0, #0
	adds r2, r3, #4
_0807CAC6:
	strb r0, [r2]
	subs r2, #1
	cmp r2, r3
	bge _0807CAC6
_0807CACE:
	ldr r0, [r5]
	ldr r1, [r1]
	movs r2, #0xb7
	lsls r2, r2, #2
	movs r3, #0
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r3, #0xb
	bl sub_08073304
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CAF0: .4byte gUnknown_081D9340
_0807CAF4: .4byte gUnknown_081D9344
_0807CAF8: .4byte gUnknown_03005950

