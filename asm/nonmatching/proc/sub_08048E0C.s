	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08048E0C
sub_08048E0C: @ 0x08048E0C
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	bl sub_0801237C
	ldr r1, _08048E9C @ =gDispIo
	ldrb r0, [r1, #1]
	movs r2, #0x20
	mov r8, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #1]
	ldr r0, _08048EA0 @ =gUnknown_03002B40
	movs r6, #2
	strb r6, [r0]
	ldr r1, _08048EA4 @ =gUnknown_03002EFC
	movs r0, #0x72
	strb r0, [r1]
	ldr r1, _08048EA8 @ =gUnknown_03002B4C
	movs r0, #0xef
	strb r0, [r1]
	ldr r1, _08048EAC @ =gUnknown_03002B44
	movs r0, #0xa0
	strb r0, [r1]
	ldr r1, _08048EB0 @ =gUnknown_030030A4
	ldrb r0, [r1]
	movs r3, #1
	orrs r0, r3
	orrs r0, r6
	movs r2, #4
	orrs r0, r2
	movs r5, #8
	orrs r0, r5
	movs r4, #0x10
	orrs r0, r4
	strb r0, [r1]
	ldr r1, _08048EB4 @ =gUnknown_030030DC
	ldrb r0, [r1]
	orrs r0, r3
	orrs r0, r6
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	bl sub_08012358
	ldr r2, _08048EB8 @ =gUnknown_030030E0
	ldrb r1, [r2]
	movs r0, #0x3f
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	orrs r0, r6
	strb r0, [r2]
	ldrb r0, [r2, #1]
	orrs r0, r5
	orrs r0, r4
	strb r0, [r2, #1]
	ldr r1, _08048EBC @ =gUnknown_03002020
	movs r0, #0xf
	strh r0, [r1]
	ldr r1, _08048EC0 @ =gUnknown_03002B28
	movs r0, #6
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08048E9C: .4byte gDispIo
_08048EA0: .4byte gUnknown_03002B40
_08048EA4: .4byte gUnknown_03002EFC
_08048EA8: .4byte gUnknown_03002B4C
_08048EAC: .4byte gUnknown_03002B44
_08048EB0: .4byte gUnknown_030030A4
_08048EB4: .4byte gUnknown_030030DC
_08048EB8: .4byte gUnknown_030030E0
_08048EBC: .4byte gUnknown_03002020
_08048EC0: .4byte gUnknown_03002B28

