	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0805F0EC
sub_0805F0EC: @ 0x0805F0EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #1
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	add r0, sp, #4
	bl sub_08058F30
	ldr r4, _0805F224 @ =gUnknown_030013EC
	ldr r5, _0805F228 @ =gUnknown_0816DAA4
	ldr r0, [r5]
	ldr r2, [r0]
	ldrb r0, [r2, #2]
	ldrb r1, [r2, #3]
	ldrb r2, [r2]
	add r3, sp, #4
	ldrb r3, [r3]
	mov r6, r8
	str r6, [sp]
	ldr r4, [r4]
	bl _call_via_r4
	ldr r1, _0805F22C @ =0xFFFF0000
	ldr r0, [sp, #8]
	ands r0, r1
	ldr r1, _0805F230 @ =0x0000270F
	orrs r0, r1
	str r0, [sp, #8]
	movs r6, #0
	ldr r0, _0805F234 @ =gUnknown_08499590
	ldr r2, [r0]
	mov r1, sp
	adds r1, #8
	str r1, [sp, #0x10]
	ldrh r3, [r2, #2]
	cmp r6, r3
	blt _0805F142
	b _0805F286
_0805F142:
	mov sb, r0
	adds r7, r2, #0
_0805F146:
	movs r5, #0
	adds r0, r6, #1
	mov ip, r0
	ldrh r1, [r7]
	cmp r5, r1
	blt _0805F154
	b _0805F27C
_0805F154:
	ldr r2, _0805F238 @ =gUnknown_085D584C
	mov sl, r2
_0805F158:
	lsls r0, r6, #2
	ldr r3, _0805F23C @ =gUnknown_03003340
	adds r0, r0, r3
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bge _0805F16E
	b _0805F26E
_0805F16E:
	adds r2, r5, #0
	cmp r5, #0
	bge _0805F176
	adds r2, r5, #3
_0805F176:
	asrs r2, r2, #2
	adds r1, r6, #0
	cmp r6, #0
	bge _0805F180
	adds r1, r6, #3
_0805F180:
	asrs r1, r1, #2
	ldr r4, _0805F240 @ =gUnknown_0202DAD8
	movs r0, #0x2c
	muls r2, r0, r2
	lsls r0, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r1, r4, #0
	adds r1, #0x14
	adds r1, r2, r1
	adds r0, r4, #0
	adds r0, #0x18
	adds r0, r2, r0
	ldr r1, [r1]
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x1c
	adds r0, r2, r0
	ldr r0, [r0]
	adds r1, r1, r0
	ldr r0, _0805F244 @ =gUnknown_030046B8
	ldrb r3, [r0]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0805F1C2
	adds r0, r4, #0
	adds r0, #0x20
	adds r0, r2, r0
	ldr r0, [r0]
	adds r1, r1, r0
_0805F1C2:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _0805F1D4
	adds r0, r4, #0
	adds r0, #0x24
	adds r0, r2, r0
	ldr r0, [r0]
	adds r1, r1, r0
_0805F1D4:
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bhi _0805F26E
	str r1, [sp, #0xc]
	ldr r0, _0805F248 @ =gUnknown_030040D8
	ldr r1, [r0]
	ldrb r0, [r1]
	cmp r0, #0
	beq _0805F1F6
	adds r1, r0, #0
	movs r0, #0x5c
	muls r0, r1, r0
	ldr r1, _0805F24C @ =gUnknown_085D5ABC
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	cmp r0, #0x10
	beq _0805F258
_0805F1F6:
	mov r2, sb
	ldr r1, [r2]
	lsls r2, r6, #1
	ldr r3, _0805F250 @ =0x0000417A
	adds r0, r1, r3
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r0, r0, r5
	ldr r2, _0805F254 @ =0x00001432
	adds r1, r1, r2
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r1, #0x1f
	ands r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, sl
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	b _0805F25A
	.align 2, 0
_0805F224: .4byte gUnknown_030013EC
_0805F228: .4byte gUnknown_0816DAA4
_0805F22C: .4byte 0xFFFF0000
_0805F230: .4byte 0x0000270F
_0805F234: .4byte gUnknown_08499590
_0805F238: .4byte gUnknown_085D584C
_0805F23C: .4byte gUnknown_03003340
_0805F240: .4byte gUnknown_0202DAD8
_0805F244: .4byte gUnknown_030046B8
_0805F248: .4byte gUnknown_030040D8
_0805F24C: .4byte gUnknown_085D5ABC
_0805F250: .4byte 0x0000417A
_0805F254: .4byte 0x00001432
_0805F258:
	movs r0, #0
_0805F25A:
	cmp r8, r0
	bge _0805F26E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r5, #0x10
	lsls r1, r6, #0x10
	lsrs r0, r0, #0x10
	orrs r0, r1
	str r0, [sp, #8]
_0805F26E:
	adds r5, #1
	mov r3, sb
	ldr r0, [r3]
	ldrh r0, [r0]
	cmp r5, r0
	bge _0805F27C
	b _0805F158
_0805F27C:
	mov r6, ip
	ldrh r0, [r7, #2]
	cmp r6, r0
	bge _0805F286
	b _0805F146
_0805F286:
	ldr r2, [sp, #0x10]
	ldrh r1, [r2]
	ldr r0, _0805F2B0 @ =0x0000270F
	cmp r1, r0
	bne _0805F294
	bl sub_0805F4F8
_0805F294:
	ldr r0, [sp, #0x10]
	bl sub_080591E4
	bl sub_0805F7B8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805F2B0: .4byte 0x0000270F

